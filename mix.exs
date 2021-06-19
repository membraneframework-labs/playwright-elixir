defmodule Playwright.MixProject do
  use Mix.Project

  def project do
    [
      app: :playwright,
      dialyzer: dialyzer(),
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      preferred_cli_env: [credo: :test, dialyzer: :test, docs: :docs],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Playwright, []},
      extra_applications: [:logger]
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowlib, "~> 2.11.0", override: true},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :docs, runtime: false},
      {:gun, "~> 1.3"},
      {:jason, "~> 1.2"},
      {:mix_audit, "~> 0.1", only: [:dev, :test], runtime: false},
      {:plug, "~> 1.11.1", only: [:dev, :test]},
      {:recase, "~> 0.7.0"},
      {:plug_cowboy, "~> 2.5.0", only: [:dev, :test]}
    ]
  end

  defp docs do
    [
      name: "Playwright",
      source_url: "https://github.com/geometerio/playwright-elixir",
      homepage_url: "https://github.com/geometerio/playwright-elixir",
      main: "Playwright",
      groups_for_modules: [
        "Features (usage)": [
          Playwright.Browser,
          Playwright.BrowserContext,
          Playwright.BrowserType,
          Playwright.ElementHandle,
          Playwright.Page,
          Playwright.Playwright,
          Playwright.RemoteBrowser
        ],
        "Helpers (usage)": [
          PlaywrightTest.Case
        ],
        "Runner (internal)": [
          Playwright.Runner.Config,
          Playwright.Runner.Config.Types,
          Playwright.Runner.ChannelMessage,
          Playwright.Runner.Transport.Driver,
          Playwright.Runner.Transport.DriverMessage,
          Playwright.Runner.Transport.WebSocket
        ]
      ]
    ]
  end
end
