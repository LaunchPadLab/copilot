if defined?(ActiveAdmin)

  ActiveAdmin.register Copilot::Content, as: "Content" do

    menu false

    actions :all, except: [:new, :create, :destroy]

    index title: "Site Content" do
      column "Page" do |content|
        content.slug.split('.').shift.humanize
      end
      column "Section", :slug do |content|
        content.slug.split(".")[1].humanize
      end
      column "Content Name" do |content|
        content.slug.split(".").last.humanize
      end
      column "Content Value", :value
      actions
    end

    filter :slug, label: "Section Names"
    filter :value, label: "Content"

    form name: "Edit Content" do |f|
      f.semantic_errors
      f.inputs "Details" do
        f.input :slug, label: "Name", :input_html => { :disabled => true }
        f.input :value, as: :text, label: "Content"
      end
      f.actions
    end

    controller do

      def edit
        @page_title = "Edit Content"
        super
      end

      def permitted_params
        params.permit(:content => [:value])
      end

    end

  end
end
