module ViewHelper
  def boolean_to_icon(bool)
    bool ? fa_icon("check") : fa_icon("cross")
  end
end
