class TaskSerializer
    def initialize(task)
      @task = task
    end

    def as_json(*)
      {
        title: @task.title,
        content: @task.content,
        status: @task.status,
        created: @task.created_at,
        updated: @task.updated_at,
      }
    end
end
