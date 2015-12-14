class Mentee::ProfilesController < ApplicationController
    def mentor_profiles
        @mentors = User.mentors
    end
end