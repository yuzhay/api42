require 'api42/base'
require 'api42/v2/users'
require 'api42/v2/projects'
require 'api42/v2/projects_users'
require 'api42/v2/campus'
require 'api42/v2/campus_users'
require 'api42/v2/cursus'
require 'api42/v2/cursus_users'
require 'api42/v2/exams'
require 'api42/v2/evaluations'
require 'api42/v2/levels'
require 'api42/v2/feedbacks'
require 'api42/v2/locations'
require 'api42/v2/events'
require 'api42/v2/events_users'
require 'api42/v2/pools'

module Api42
  class Client < Api42::Base

    def users(options = {})
      @users ||= Api42::V2::Users.new(options)
    end

    def projects(options = {})
      @projects ||= Api42::V2::Projects.new(options)
    end

    def projects_users(options = {})
      @projects_users ||= Api42::V2::ProjectsUsers.new(options)
    end

    def campus(options = {})
      @campus ||= Api42::V2::Campus.new(options)
    end

    def campus_users(options = {})
      @campus_users ||= Api42::V2::CampusUsers.new(options)
    end

    def cursus(options = {})
      @cursus ||= Api42::V2::Cursus.new(options)
    end

    def cursus_users(options = {})
      @cursus_users ||= Api42::V2::CursusUsers.new(options)
    end

    def exams(options = {})
      @exams ||= Api42::V2::Exams.new(options)
    end

    def evaluations(options = {})
      @evaluations ||= Api42::V2::Evaluations.new(options)
    end

    def levels(options = {})
      @levels ||= Api42::V2::Levels.new(options)
    end

    def feedbacks(options = {})
      @feedbacks ||= Api42::V2::Feedbacks.new(options)
    end

    def locations(options = {})
      @locations ||= Api42::V2::Locations.new(options)
    end

    def events(options = {})
      @events ||= Api42::V2::Events.new(options)
    end

    def events_users(options = {})
      @events_users ||= Api42::V2::EventsUsers.new(options)
    end

    def pools(options = {})
      @pools ||= Api42::V2::Pools.new(options)
    end
  end
end
