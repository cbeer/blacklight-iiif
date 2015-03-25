module Blacklight
  module IiifDocument
    def to_iiif_presentation
      if document.has? blacklight_config.iiif.presentation_field
        presentation = document[blacklight_config.iiif.presentation_field]
        case presentation
          when true # IIIF presentation
          when true # URI to IIIF presentation
        end
      else
        {
          "@id" => '',
          label: iiif_label,
          description: iiif_description,
          thumbnail: iiif_thumbnail,
          metadata: { iiif_presentation_metadata },
          sequences: [iiif_canvas]
        }
      end
    end

    def iiif_label
      view_context.document_heading(self)
    end

    def iiif_description
      if field = blacklight_config.view_config(:iiif).description_field
        first(field)
      end
    end

    def iiif_thumbnail
      if field = blacklight_config.view_config(:iiif).thumbnail_field
        first(field)
      end
    end

    def iiif_presentation_metadata
      blacklight_config.show_fields.map do |field|
        { label: view_context.render_document_show_field_label(field), value: view_context.render_document_show_field_value(field) }
      end
    end

    def iiif_canvas
      Array(document[blacklight_config.iiif.canvas_field]).map do |canvas|
        obj = Riiif::Image.file_resolver.find(canvas)
        case
          when !canvas.starts_with("http") # embedded IIIF manifest
            
          when canvas.ends_with("info.json") #"URL to manifest"
          when true #"URL to iiif image"
          when true #"URL to image"
        end
      end
    end

    def blacklight_config
      response.blacklight_config
    end

    def view_context
      CatalogController.view_context
    end
  end
end