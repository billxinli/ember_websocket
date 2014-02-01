class Api::V1::ChatsController< Api::V1::BaseController
  before_action :set_pagination, only: [:index]
  before_action :set_ransack
  before_action :build_chat, only: [:new, :create]
  before_action :load_chat, except: [:index, :new, :create, :tree]

  def index
    @chats = @ransack

    if (@per_page and @per_page > 0)
      @chats = @chats.page(@page).per(@per_page)
    end
  end

  def create
    @chat.save!
  rescue ActiveRecord::RecordInvalid
    api_error!('Invalid chat', @chat.errors)
  end

  def show
  end

  def update
    @chat.update_attributes!(chat_params)
  rescue ActiveRecord::RecordInvalid
    api_error!('Invalid chat', @chat.errors)
  end

  def destroy
    @chat.destroy
  end

  protected
  def set_ransack
    @ransack = scope_this.search(params[:q])
    @ransack = @ransack.result
  end

  def build_chat
    @chat = Chat.new(chat_params)
  end

  def load_chat
    @chat = scope_this.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    api_error!('Invalid chat', params)
  end

  def scope_this
    scope = Chat
    scope
  end

  def chat_params
    params.fetch(:chat, {}).permit(
      :name,
      :message
    )
  end
end
