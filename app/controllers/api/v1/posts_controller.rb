# 
# Postに関するCRUD操作APIを定義
# 

# - 名前空間
module Api
    module V1

        # コントローラー
        class PostsController < ApplicationController

            # パラメータに紐づくPostの取得を共通化
            before_action :set_post, only: [:show, :update, :destroy]

            # サーバー構築時にエラーが発生する場合
            # skip_before_action :verify_authenticity_token

            # Post一覧取得
            def index
                posts = Post.order(created_at: :desc)

                # renderメソッド jsonオプション =>　指定したオブジェクトをJSON形式でレスポンス
                render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }
            end

            # Post取得
            def show
                render json: { status: 'SUCCESS', message: 'Loaded the post', data: @post }
            end

            # Post 作成
            def create
                post = Post.new(post_params)
                if post.save
                render json: { status: 'SUCCESS', data: post }
                else
                render json: { status: 'ERROR', data: post.errors }
                end
            end

            # Post削除
            def destroy
                @post.destroy
                render json: { status: 'SUCCESS', message: 'Deleted the post', data: @post }
            end

            # Post更新
            def update
                if @post.update(post_params)
                render json: { status: 'SUCCESS', message: 'Updated the post', data: @post }
                else
                render json: { status: 'SUCCESS', message: 'Not updated', data: @post.errors }
                end
            end

            private
                #  Postの取得 共通化
                def set_post
                    @post = Post.find(params[:id])
                end

                # ストロングパラメータ
                def post_params
                    params.require(:post).permit(:title)
                end
        end
    end
end
