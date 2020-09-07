require 'rails_helper'

RSpec.describe "Albums", type: :request do
  it "can create" do
    user = User.create! email: "test@example.com", password: "password"
    sign_in user
    expect {
      post albums_path, params: { album: { artist: "artist", title: "test"}}
      expect(response).to have_http_status(302)
    }.to change {Album.count}.by(1)
  end

  it "can favorite an album" do
    user = User.create! email: "test@example.com", password: "password"
    sign_in user
    album = Album.create!(title: "test", artist: "anyone")
    expect {
      post favorite_album_path(album)
    }.to change {user.favorites.count}.by(1)
    expect(user.favorites.first.favoritable).to eq(album)
  end
end
