class Setting
    include ActiveModel::Model

    attr_accessor :info_fb, :info_dob, :info_city , :info_interests

    def save(info)
        info.update_attributes(dob: info_dob, city: info_city , interests: info_interests, fb: info_fb) 
    end
end
