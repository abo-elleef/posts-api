module API
  module V1
    class Posts < Grape::API
      include API::V1::Defaults

      def permitted_params
        params.fetch(:post).permit([:text, :user_id, :nature])
        params.permit(:id)
      end

      resource :posts do
        desc "Return all graduates"
        get "", root: :posts do
          Post.includes(:user).all
        end

        desc "Return a post"
        params do
          requires :id, type: String, desc: "ID of the post"
        end
        get ":id", root: "post" do
          Post.where(id: permitted_params[:id]).first!
        end

        desc "Delete a post"
        params do
          requires :id, type: String, desc: "ID of the post"
        end
        delete ":id", root: "post" do
          post = Post.where(id: permitted_params[:id]).first!
          post.destroy
        end

      end
    end
  end
end