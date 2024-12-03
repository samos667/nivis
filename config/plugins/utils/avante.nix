{
  plugins.avante = {
    enable = true;
    settings = {
      provider = "perplexity";
      auto_suggestions_provider = "copilot";
      vendors = {
        perplexity = {
          __inherited_from = "openai";
          api_key_name = "cmd:bw get notes perplexity-api-key";
          endpoint = "https://api.perplexity.ai";
          model = "llama-3.1-sonar-large-128k-online";
        };
        ollama = {
          __inherited_from = "openai";
          api_key_name = "";
          endpoint = "http://127.0.0.1:11434/v1";
          model = "codegemma";
        };
      };
      # dual_boost = {
      #   enabled = false;
      #   first_provider = "perplexity";
      #   second_provider = "ollama";
      #   prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]";
      #   timeout = 60000;
      # };
      diff = {
        autojump = true;
        debug = false;
        list_opener = "copen";
      };
      behaviour = {
        auto_suggestions = false;
      };
      highlights = {
        diff = {
          current = "DiffText";
          incoming = "DiffAdd";
        };
      };
      hints = {
        enabled = true;
      };
      mappings = {
        diff = {
          both = "cb";
          next = "]x";
          none = "c0";
          ours = "co";
          prev = "[x";
          theirs = "ct";
        };
      };
      windows = {
        sidebar_header = {
          align = "center";
          rounded = true;
        };
        width = 30;
        wrap = true;
      };
    };
  };
}
