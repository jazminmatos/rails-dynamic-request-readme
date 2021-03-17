require 'rails_helper'

describe 'navigate' do

  # Need to draw routs in config/routes.rb
  # create posts_controller.rb & PostController class
    before do
    @post = Post.create(title: "My Post", description: "My post desc")
  end


  # Add the show action in the PostController class
  # Create app/views/posts/show.html.erb
  it 'loads the show page' do
    visit "/posts/#{@post.id}"
    expect(page.status_code).to eq(200)
  end

  # Add @post = Post.find(params[:id]) to show action (Retrieve ID via params)
  # Add <h1><%= @post.title %></h1> to app/views/posts/show.html.erb
   it 'shows the title on the show page in an h1 tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css("h1", text: "My Post")
  end

  # Add <p><%= @post.description %></p> to app/views/posts/show.html.erb 
  # (Make sure to have @post = Post.find(params[:id]) added to show action)
  it 'shows the description on the show page in a p tag' do
    visit "/posts/#{@post.id}"
    expect(page).to have_css("p", text: "My post desc")
  end 
end 