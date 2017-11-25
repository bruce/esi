defmodule ESI.API.Opportunities do

  @doc """
  Return a list of opportunities groups.

  ## Response Example

  A list of opportunities group ids:

      [100, 101, 102, 103]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_opportunities_groups`
  - `path` -- `/opportunities/groups/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Opportunities/get_opportunities_groups)

  """
  @spec groups() :: ESI.Request.t
  def groups() do
    %ESI.Request{
      verb: :get,
      path: "/opportunities/groups/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Return information of an opportunities task.

  ## Response Example

  Details of an opportunities task:

      %{"description" => "To use station services...",
        "name" => "Dock in the station",
        "notification" => "Completed:<br>Docked in a station!", "task_id" => 10}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_opportunities_tasks_task_id`
  - `path` -- `/opportunities/tasks/{task_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Opportunities/get_opportunities_tasks_task_id)

  """
  @spec task(task_id :: integer) :: ESI.Request.t
  def task(task_id) do
    %ESI.Request{
      verb: :get,
      path: "/opportunities/tasks/#{task_id}/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Return a list of opportunities tasks.

  ## Response Example

  A list of opportunities task ids:

      [1, 2, 3, 4]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_opportunities_tasks`
  - `path` -- `/opportunities/tasks/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Opportunities/get_opportunities_tasks)

  """
  @spec tasks() :: ESI.Request.t
  def tasks() do
    %ESI.Request{
      verb: :get,
      path: "/opportunities/tasks/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Opportunities.group/2`](#group/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type group_opts :: [group_opt]
  @type group_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Return information of an opportunities group.

  ## Response Example

  Details of an opportunities group:

      %{"connected_groups" => [100], "description" => "As a capsuleer...",
        "group_id" => 103, "name" => "Welcome to New Eden",
        "notification" => "Completed:<br>Welcome to New Eden",
        "required_tasks" => [19]}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_opportunities_groups_group_id`
  - `path` -- `/opportunities/groups/{group_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Opportunities/get_opportunities_groups_group_id)

  """
  @spec group(group_id :: integer, opts :: group_opts) :: ESI.Request.t
  def group(group_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/opportunities/groups/#{group_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end