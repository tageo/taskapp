class ProjectsController < ApplicationController


	before_action :set_project, only: [:show, :edit, :update, :destroy]


	def index 
		@projects = Project.all
	end


	def show
		#@project = Project.find(params[:id])

	end



	def new
		@project = Project.new
	end


	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to projects_path #一覧へ
		else
			render 'new'
		end
	end


	def edit
		#@project = Project.find(params[:id])
	end


	def destroy
		#@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path #一覧へ
	end



	def update
		#@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to projects_path #一覧へ
		else
			render 'edit'
		end

	end


	#昔はやらなかったが最近はセキュリティ上、formで送られてきた値は以下のようにフィルタリングする
	private
		def project_params
			params[:project].permit(:title)
		end

		def set_project
			@project = Project.find(params[:id])
		end


end
