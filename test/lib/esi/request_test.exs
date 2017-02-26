defmodule ESI.RequestTest do
  use ExUnit.Case, async: true

  describe "ESI.Request.opts_by_location/1" do

    @request %ESI.Request{path: "/", verb: :get}

    test "given an empty request" do
      assert %{body: %{}, query: %{}} = ESI.Request.opts_by_location(@request)
    end

    test "given a superfluous option" do
      request = @request
      |> ESI.Request.options(foo: 1)
      assert %{body: %{}, query: %{}} = ESI.Request.opts_by_location(request)
    end

    test "given a valid query option" do
      request = %{@request | opts_schema: %{foo: {:query, :required}}}
      |> ESI.Request.options(foo: 1)
      assert %{body: %{}, query: %{foo: 1}} = ESI.Request.opts_by_location(request)
    end

    test "given a valid body option" do
      request = %{@request | opts_schema: %{foo: {:body, :required}}}
      |> ESI.Request.options(foo: 1)
      assert %{query: %{}, body: %{foo: 1}} = ESI.Request.opts_by_location(request)
    end

    test "given valid options" do
      request = %{@request | opts_schema: %{foo: {:body, :required}, bar: {:query, :optional}}}
      |> ESI.Request.options(foo: 1, bar: 2)
      assert %{query: %{bar: 2}, body: %{foo: 1}} = ESI.Request.opts_by_location(request)
    end

  end

  describe "ESI.Request.encode_options/1" do

    @request %ESI.Request{
      path: "/",
      verb: :get,
      opts_schema: %{foo: {:body, :required}, bar: {:query, :optional}},
    }

    test "given an empty request" do
      assert %{body: "", query: ""} = ESI.Request.encode_options(@request)
    end

    test "given a superfluous option" do
      request = @request
      |> ESI.Request.options(spam: 1)
      assert %{body: "", query: ""} = ESI.Request.encode_options(request)
    end

    test "given a valid query option" do
      request = @request |> ESI.Request.options(bar: 1)
      assert %{body: "", query: "?bar=1"} = ESI.Request.encode_options(request)
    end

    test "given a valid body option" do
      request = @request |> ESI.Request.options(foo: 1)
      assert %{query: "", body: ~s<{"foo":1}>} = ESI.Request.encode_options(request)
    end

    test "given valid options" do
      request = @request |> ESI.Request.options(foo: 1, bar: 2)
      assert %{query: "?bar=2", body: ~s<{"foo":1}>} = ESI.Request.encode_options(request)
    end

  end

  describe "ESI.Request.validate/1" do

    @request %ESI.Request{
      path: "/",
      verb: :get,
      opts_schema: %{foo: {:body, :required}, bar: {:query, :optional}, baz: {:query, :required}},
    }

    test "missing one required option" do
      request = @request |> ESI.Request.options(baz: 1)
      assert {:error, "missing option `:foo`"} = ESI.Request.validate(request)
    end

    test "missing more than one required option" do
      assert {:error, "missing options `:foo`, `:baz`"} = ESI.Request.validate(@request)
    end

    test "providing a superfluous option" do
      request = @request |> ESI.Request.options(foo: 1, baz: 2, extra: 3)
      assert :ok = ESI.Request.validate(request)
    end

    test "providing the correct options" do
      request = @request |> ESI.Request.options(foo: 1, baz: 2)
      assert :ok = ESI.Request.validate(request)
    end

  end

end