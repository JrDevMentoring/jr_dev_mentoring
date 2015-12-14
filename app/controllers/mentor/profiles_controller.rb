class Mentor::ProfilesController < ApplicationController
    def mentee_profiles
        @mentees = User.mentees
    end
end