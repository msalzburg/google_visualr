module GoogleVisualr
  module Visualizations

    class LineChart < BaseChart
      include GoogleVisualr::Packages::CoreChart
      
      # http://code.google.com/apis/visualization/documentation/gallery/linechart.html

      attr_accessor :backgroundColor
      attr_accessor :colors
      attr_accessor :curveType
      attr_accessor :hAxis
      attr_accessor :height
      attr_accessor :legend
      attr_accessor :legendFontSize
      attr_accessor :legendTextColor
      attr_accessor :lineWidth
      attr_accessor :pointSize
      attr_accessor :reverseCategories
      attr_accessor :title
      attr_accessor :titleColor
      attr_accessor :titleFontSize
      attr_accessor :tooltipFontSize
      attr_accessor :vAxis
      attr_accessor :width

    end
  
  end
end