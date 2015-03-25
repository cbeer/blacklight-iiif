module Blacklight::Iiif
  class DocumentFileResolver
    def find(id)
      remote = RemoteFile.new(uri(id),
                              cache_path: cache_path,
                              basic_auth_credentials: basic_auth_credentials)
      Riiif::File.new(remote.fetch)
    end

    class RemoteFile

      def iiif_manifest?
      end

      def iiif_enabled?
      end
    end
  end
end