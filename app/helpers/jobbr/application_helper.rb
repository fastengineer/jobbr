module Jobbr
  module ApplicationHelper

    def delayed_job_creation_path(delayed_job_class, params = {})
      jobbr.delayed_jobs_path(params.merge(job_name: delayed_job_class.name.underscore))
    end

    def delayed_job_polling_path(id = ':job_id')
      jobbr.delayed_job_path(id)
    end

    def status_icon(job_status)
      css_class = "job-status #{job_status}"
      if job_status == :waiting
        icon 'circle-o', class: css_class
      elsif job_status == :running
        icon 'refresh', class: "#{css_class} fa-spin"
      elsif job_status == :success
        icon 'certificate', class: css_class
      else
        icon 'exclamation-circle', class: css_class
      end
    end

    def display_scheduling(job)
      every = job.every
      if every
        scheduling = every[0].is_a?(Fixnum) ? ChronicDuration.output(every[0]) : every[0].to_s
        if every[1] && !every[1].empty?
          scheduling = "#{scheduling} at #{every[1][:at]}"
        end
        scheduling
      end
    end

  end
end
