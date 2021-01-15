module WhispersHelper
    def new_or_edit
        if action_name == 'new' || action_name == 'create'
            confirm_whispers_path
        elsif action_name == 'edit'
            whisper_path
        end
    end
end
