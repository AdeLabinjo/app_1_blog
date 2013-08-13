require 'spec_helper'
describe Comment do
  before do 
    @comment = Comment.new(:commenter => 'Ade', :body => 'Hello')
  end 
  
  #Attributes 
  it "should respond to title" do
    expect(@comment).to respond_to(:commenter)
  end 
  
  it "should respond to body" do 
    expect(@comment).to respond_to(:body)
  end 
  
  #validation 
  
  it "commenter should not be blank" do
    
    @comment.commenter = " "
    @comment.should_not be_valid
  end 
  
  it "body should not be blank" do 
    @comment.body = " "
    @comment.should_not be_valid 
  end 
   
end
