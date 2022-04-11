class PlanEstrategicoController < ApplicationController
  def index
  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/documents/plan_estrategico.pdf",
      filename: "Plan Estratégico 2020-2024.pdf",
      type: "application/pdf"
    )
  end
end
