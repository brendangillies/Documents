class ApprovalDocsController < ApplicationController
  before_action :set_approval_doc, only: [:show, :edit, :update, :destroy]

  # GET /approval_docs
  # GET /approval_docs.json
  def index
    @approval_docs = ApprovalDoc.all
  end

  # GET /approval_docs/1
  # GET /approval_docs/1.json
  def show
  end

  # GET /approval_docs/new
  def new
    @approval_doc = ApprovalDoc.new
  end

  # GET /approval_docs/1/edit
  def edit
  end

  # POST /approval_docs
  # POST /approval_docs.json
  def create
    @approval_doc = ApprovalDoc.new(approval_doc_params)

    respond_to do |format|
      if @approval_doc.save
        format.html { redirect_to @approval_doc, notice: 'Approval doc was successfully created.' }
        format.json { render :show, status: :created, location: @approval_doc }
      else
        format.html { render :new }
        format.json { render json: @approval_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /approval_docs/1
  # PATCH/PUT /approval_docs/1.json
  def update
    respond_to do |format|
      if @approval_doc.update(approval_doc_params)
        format.html { redirect_to @approval_doc, notice: 'Approval doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @approval_doc }
      else
        format.html { render :edit }
        format.json { render json: @approval_doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /approval_docs/1
  # DELETE /approval_docs/1.json
  def destroy
    @approval_doc.destroy
    respond_to do |format|
      format.html { redirect_to approval_docs_url, notice: 'Approval doc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_approval_doc
      @approval_doc = ApprovalDoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def approval_doc_params
      #params[:approval_doc]
      params.require(:article).permit(:id, :name, :line_item_id)
    end
end
