class Mentor::ProfilesController < Mentor::MentorController
    def mentee_profiles
        @mentees = User.mentees
    end
end