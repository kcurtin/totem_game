ExUnit.start()

defmodule DBTransactions do
  use ExUnit.CaseTemplate

  setup_all do
    Ecto.Adapters.SQL.begin_test_transaction(Totem.Repo)

    on_exit fn ->
      Ecto.Adapters.SQL.rollback_test_transaction(Totem.Repo)
    end
  end

  setup do
    Ecto.Adapters.SQL.restart_test_transaction(Totem.Repo, [])
  end
end
