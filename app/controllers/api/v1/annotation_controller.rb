class Api::V1::AnnotationController < ApplicationController
  def index
    @annotations = Annotation.all
    render json: {
      status: 200,
      data: @annotations
    }
  end

  def show
    @annotation = Annotation.find(params[:id])

    render json: {
      status: 200,
      data: @annotation
    }
  end

  def create
    unless User.exists?(validator[:user_id])
      return render status: 404, json: {
        status: 404,
        error: 'User not found!'
      }
    end

    @annotation = Annotation.new(validator)

    @annotation.valid? && @annotation.save

    render json: {
      status: 200,
      data: @annotation
    }
  end

  def update
    unless !validator[:user_id] || User.exists?(validator[:user_id])
      return render status: 404, json: {
        status: 404,
        error: 'User not found!'
      }
    end

    @annotation = Annotation.find(params[:id])

    if @annotation.update(validator)
      render json: {
        status: 200,
        data: validator
      }
    end
  end

  def destroy
    @annotation = Annotation.find(params[:id])

    if @annotation.destroy
      render json: {
        status: 200,
        data: {}
      }
    end
  end

  private

  def validator
    params.permit(
      :content,
      :lat,
      :long,
      :user_id
    )
  end
end
