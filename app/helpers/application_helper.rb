module ApplicationHelper

  def slide_over_form_wrapper(title:, subtitle: nil, &block)
    content = capture &block

    render partial: 'shared/slide_over', locals: { title:, subtitle:, content: }
  end
end
