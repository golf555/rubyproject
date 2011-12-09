class UsersController < ApplicationController
def index

end

def authorization
@fuser=Users.where('uname = ? and pw = ?', params[:uname], params[:pw])
if @fuser.first.nil?
redirect_to :controller => 'users', :action => 'register'
else
redirect_to :controller => 'users', :action => 'home'
end
end

def register
if params[:fname] != "" && params[:sname] != "" && params[:uname] != "" && params[:email] != "" && params[:pw] != "" && params[:fname] != nil && params[:sname] != nil && params[:uname] != nil && params[:email] != nil && params[:pw] != nil
 @po = Users.new
 @po.fname = params[:fname]
 @po.sname = params[:sname]
 @po.uname = params[:uname]
 @po.email = params[:email]
 @po.pw = params[:pw]
 @po.save
 redirect_to :controller => 'users', :action => 'index'
 else
@e='Don''t fill'
end
end

def home
@pos = Post.order('id').reverse
@comm = Comment.where('postid = ?', params[:id]).order('id').reverse
end

def comment
 if params[:postid] != nil && params[:name]!= nil && params[:bodycomment]!= nil 
 @co = Comment.new
 @co.postid = params[:postid]
 @co.name = params[:name]
 @co.bodycomment = params[:bodycomment]
 @co.save
 redirect_to :controller => 'users', :action => 'home', :id => params[:postid]
 else
 redirect_to :controller => 'users', :action => 'home'
 end
 end

end
