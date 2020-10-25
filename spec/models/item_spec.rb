require 'rails_helper'
RSpec.describe '投稿機能', type: :model, do: true do
  context 'バリデーション' do
    let(:image_path) { Rails.root.join('spec/factories/test.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
     # 品名と説明とステータスがあれば有効な状態であること
    it "品名がなければバリデーションが通らない" do
      item = FactoryBot.build(:item, name: nil)
      expect(item).not_to be_valid
    end
    it "説明がなければバリデーションが通らない" do
      item = FactoryBot.build(:item, description: nil)
      expect(item).not_to be_valid
    end
    it "ステータスがなければバリデーションが通らない" do
      item = FactoryBot.build(:item, status: nil)
      expect(item).not_to be_valid
    end
      # 品名が31文字以上,説明が501文字以上ならバリデーションが通らないな状態であること
    it "品名が31文字以上であればバリデーションが通らない" do
      item = FactoryBot.build(:item, name: 'a' * 31)
      expect(item).not_to be_valid
    end
    it "説明が501文字以上であればバリデーションが通らない" do
      item = FactoryBot.build(:item, description: 'a' * 501)
      expect(item).not_to be_valid
    end
    it '品名と説明とステータスに内容が記載されていればバリデーションが通る' do
      item = FactoryBot.build(:item, name: '', description: '', status: '')
      expect(item).not_to be_valid
      expect(item.errors[:name]).to be_present
      expect(item.errors[:description]).to be_present
      expect(item.errors[:status]).to be_present
    end
    # it "画像(2数)でもバリデーションが通る" do
    #   item = create(:item, images: [image, image])
    #   expect(item).to be_valid
    # end
    # it "画像(3数)でもバリデーションが通る" do
    #   item = create(:item, images: [image, image, image])
    #   expect(item).to be_valid
    end
  end
end
