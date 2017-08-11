module ApplicationHelper

    def flash_class(level)
        case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-error"
        when 'alert' then "alert alert-error"

        end
    end

    def resource_name
        :user
    end

    def resource
        @resource || User.new
    end

    def devise_mapping
        @devise_mapping || Devise.mappings[:user]
    end

    def is_friend?(user)

        @friendship = Friendship.where("friend1_id = ? AND friend2_id = ? OR friend1_id = ? AND friend2_id = ?",current_user.id,user.id,user.id,current_user.id).first

        if @friendship
            return true
        else
            return false
        end

    end 

    def friend(user)
                        
        @friendship = Friendship.where("friend1_id = ? AND friend2_id = ? OR friend1_id = ? AND friend2_id = ?",current_user.id,user.id,user.id,current_user.id).first
        @friendship.friend2
    end

    def on_hotspots_path
        request.original_fullpath.include?("hotspots")
    end
        

end
