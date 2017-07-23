class Noinfo
    def if_absent
        yield
        self
    end

    def if_present
        self
    end
end
