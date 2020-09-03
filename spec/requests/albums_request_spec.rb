require 'rails_helper'

RSpec.describe "Albums", type: :request do
  it "can favorite an album" do
    user = User.create! email: "test@example.com", password: "password"
    sign_in user
    album = Album.create!(title: "test", artist: "anyone")
    post favorite_album_path(album)
    expect(user.favorites.first.favoritable).to eq(album)
  end
end
