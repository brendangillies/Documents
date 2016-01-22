class ApprovalCommentsController < ApplicationController
  def create
  @approval_doc = ApprovalDoc.find(params[:approval_doc_id])
  @comment = @approval_doc.approval_comments.create(comment_params)

  redirect_to approval_doc_path(@approval_doc)
end

private
 def comment_params
  params.require(:approval_comment).permit(:body)
 end

end
