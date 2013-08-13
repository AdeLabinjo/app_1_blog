require 'spec_helper'

describe "Posts" do
  before do
    @post = Post.create(:title => "Learn to code", :text => "Build an App a week")
  end 
  
  describe "GET /posts" do
    it "should display all posts" do
      visit posts_path 
      expect(page).to have_content("Learn to code")
      expect(page).to have_content("Build an App a week")
      find_link('Show').visible?
      find_link('New Post').visible? 
    end
  end
  
  describe "GET /posts/new" do 
    it "creates new post" do 
      visit new_post_path 
      fill_in 'Title', :with => 'Learn HTML'
      fill_in 'Text' , :with => 'Begin next week'
      click_button 'Create Post'
      current_path.should == root_path
      expect(page).to have_content('Learn HTML')
      expect(page).to have_content('Begin next week')
    end 
  end
  
  describe "/post/1" do 
    it "displays a single post"do
      visit posts_path
      click_link 'Show'
      current_path.should == post_path(@post)
      expect(page).to have_content('Learn to code')
      expect(page).to have_content('Build an App a week')
      find_link('Back').visible? 
    end
  end 
  
  describe "GET/post/1/edit" do 
    it "edits a post" do 
      visit posts_path 
      find_link('Back').visible?
      click_link 'Edit'
      current_path.should == edit_post_path(@post)
      fill_in 'Title', :with => 'Try Sinatra'
      fill_in 'Text',  :with => 'Begin with Sinatra docs'
      click_button 'Update'
      current_path.should == root_path 
    end 
    
    describe "delete/post/1" do
      it "deletes a single post" do 
        visit post_path(@post)
        click_link 'Delete'
        current_path == posts_path 
        expect(page).to have_no_content("Learn to code")
        expect(page).to have_no_content("Build an App a week")
      end 
    end 
    
    
  end 
  
  

end
