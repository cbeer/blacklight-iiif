module Blacklight
  module Iiif
    class DocumentPresenter < Blacklight::DocumentPresenter
      def to_iiif_presentation
        presentation_doc = {metadata: {}}
        presentation_doc.merge! @document.to_iiif_presentation

        presentation_doc[:metadata].merge!(iiif_presentation_metadata)

        unless presentation_doc[:sequences]
          presentation_doc[:sequences] = [iiif_presentation_sequence]
        end
      end

      def iiif_presentation_metadata
        doc = presenter(@document)
        
        document_show_fields(@document).inject({}) do |hash, field|
          hash[render_document_show_field_label(field)] = doc.render_document_show_field_value(field)
        end
      end

      def iiif_presentation_sequence
        sequence = {}
        sequence.merge! @document.to_iiif_presentation_sequence

        sequence[:canvases] ||= begin
          @document.to_iiif_canvas
        end
      end

      private
      delegate :presenter, :document_show_fields, :render_document_show_field_label, to: :view_context

      def view_context
        @controller.view_context
      end

      def blacklight_config
        @controller.blacklight_config
      end
    end
  end
end