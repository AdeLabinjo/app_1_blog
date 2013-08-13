require 'spec_helper'

describe Post do
  before do 
    @post = Post.new(:title => "Read Rspec Book", :text => "Start on Chapter 2")   
  end 
  
  # 1. Attributes Tests 
  
  # should respond to the atrribute title which is a method on the object
  it " should respond to 'title'" do
    expect(@post).to respond_to(:title)
  end 
  # should respond to the attribute text which is a method on the object
  it "should respond to 'text'" do
    expect(@post).to respond_to(:text) 
  end 
  
  # 2. Validation =
       
  it "should reject blank title" do 
    @post.title = " "
    @post.should_not be_valid
    @post.errors[:title].should include("can't be blank")
  end 
  
  it "should reject blank 'text' " do 
    @post.text = " "
    @post.should_not be_valid 
    @post.errors[:text].should include("can't be blank")
    
  end 
  
  
 end 
  
  
 
