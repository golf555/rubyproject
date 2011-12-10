class UsersController < ApplicationController
def index

end

def authorization
@fuser=Users.where('uname = ? and pw = ?', params[:uname], params[:pw])
if @fuser.first.nil?
redirect_to :controller => 'users', :action => 'register'
else
redirect_to :controller => 'users', :action => 'home', :id_user_home => @fuser.first.id
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
@pos = Post.where('own_user = ?', params[:id_user_home]).order('id').reverse
@id_user_home = params[:id_user_home]
@us = Users.where('id = ?', @id_user_home).first.uname
end

def post
 if params[:id]
 @own_user = params[:id_user_comment]
 @post = Post.where('id = ? and own_user = ?', params[:id], params[:id_user_comment])
 @comm = Comment.where('postid = ?', params[:id]).order('id').reverse
 end
end

def create_comment
 if params[:postid] != nil && params[:bodycomment]!= nil && params[:id_user_comment] != nil
 @us = Users.where('id = ?', params[:id_user_comment])
 @co = Comment.new
 @co.postid = params[:postid]
 @co.name = @us.first.uname
 @co.bodycomment = params[:bodycomment]
 @co.save
 redirect_to :controller => 'users', :action => 'post', :id => params[:postid]
 else
 redirect_to :controller => 'users', :action => 'home'
 end
 end

 def create_post
 if params[:postbody] != nil && params[:title] != nil && params[:id_user_post] != nil
 @po = Post.new
 @us = Users.where('id = ?', params[:id_user_post])
 @po.author = @us.first.uname
 @po.postbody = params[:postbody]
 @po.title = params[:title]
 @po.own_user = @us.first.id
 @po.save
 redirect_to :controller => 'users', :action => 'home', :id_user_home => params[:id_user_post]
 end
 end
 
end
