module Blacklight
  module IiifCatalogController
    extend ActiveSupport::Concern

    included do
    end

    def additional_export_formats(document, format)
      super

      format.jsonld { render json: document.to_iiif_presentation.merge(iiif_service_metadata(document))).to_jsonld }
    end

    def iiif_service_metadata document
      {
        service:  { },
        seeAlso:  document.export_formats.map { |format,spec| { '@id' => polymorphic_url(document, format: format), format: spec[:content_type] } } 
      }
    end
  end
end