class LanguagesController < ApplicationController
    def to_s
        "#{name}, #{level}"
    end
end
