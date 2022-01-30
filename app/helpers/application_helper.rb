module ApplicationHelper
    # 現在のページのパスを返却する
    def current_page_path
        request.path_info
    end
end
