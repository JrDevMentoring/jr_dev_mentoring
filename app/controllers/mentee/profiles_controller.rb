class Mentee::ProfilesController < Mentee::MenteeController
    def mentor_profiles
        @mentors = User.mentors
    end
end