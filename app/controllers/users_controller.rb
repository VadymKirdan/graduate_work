class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def make_admin
    @user = User.where("id = ?", params[:user_id]).first
    @user.role_id = 2
    @user.save
    redirect_to :back
  end

  def back_to_user
    @user = User.where("id = ?", params[:user_id]).first
    @user.role_id = 3
    @user.save
    redirect_to :back
  end

  def up_rank
    @user = User.where("id = ?", params[:user_id]).first
    @user.rank_id = @user.rank_id + 1
    @user.save
    redirect_to :back
  end

  def down_rank
    @user = User.where("id = ?", params[:user_id]).first
    @user.rank_id = @user.rank_id - 1
    @user.save
    redirect_to :back
  end

  def show_month
    @chart1 = Fusioncharts::Chart.new({
  :height => 400,
  :width => 1140,
  :id => 'chart2',
  :type => 'bar3d',
  :renderAt => 'chart-container',
  :dataSource => {
    :chart => {
      :caption => "Month",
      :xAxisName => "Users",
      :yAxisName => "Hours",
      :numberPrefix => "",
      :paletteColors => "#0075c2",
      :bgColor => "#ffffff",
      :borderAlpha => "20",
      :canvasBorderAlpha => "0",
      :usePlotGradientColor => "0",
      :plotBorderAlpha => "10",
      :placevaluesInside => "1",
      :rotatevalues => "1",
      :valueFontColor => "#ffffff",
      :showXAxisLine => "1",
      :xAxisLineColor => "#999999",
      :divlineColor => "#999999",
      :divLineDashed => "1",
      :showAlternateHGridColor => "0",
      :subcaptionFontBold => "0",
      :subcaptionFontSize => "14"
    },
    :data => [{
        "label": "Vadym Kirdan",
        "value": "40"
      },
      {
        "label": "John Banana",
        "value": "38"
      },
      {
        "label": "Alex Ballack",
        "value": "40"
      },
      {
        "label": "Oleg Dizhak",
        "value": "35"
      },
      {
        "label": "Johnny Banana",
        "value": "37"
      }]
  }
})
  end
  def show_year
    @chart2 = Fusioncharts::Chart.new({
  :height => 400,
  :width => 1140,
  :id => 'chart2',
  :type => 'bar3d',
  :renderAt => 'chart-container',
  :dataSource => {
    :chart => {
      :caption => "Year",
      :xAxisName => "Users",
      :yAxisName => "Hours",
      :numberPrefix => "",
      :paletteColors => "#0075c2",
      :bgColor => "#ffffff",
      :borderAlpha => "20",
      :canvasBorderAlpha => "0",
      :usePlotGradientColor => "0",
      :plotBorderAlpha => "10",
      :placevaluesInside => "1",
      :rotatevalues => "1",
      :valueFontColor => "#ffffff",
      :showXAxisLine => "1",
      :xAxisLineColor => "#999999",
      :divlineColor => "#999999",
      :divLineDashed => "1",
      :showAlternateHGridColor => "0",
      :subcaptionFontBold => "0",
      :subcaptionFontSize => "14"
    },
    :data => [{
        "label": "Vadym Kirdan",
        "value": "237"
      },
      {
        "label": "John Banana",
        "value": "222"
      },
      {
        "label": "Alex Ballack",
        "value": "213"
      },
      {
        "label": "Oleg Dizhak",
        "value": "240"
      },
      {
        "label": "Johnny Banana",
        "value": "229"
      }]
  }
})
  end

  def show_week
  @chart = Fusioncharts::Chart.new({
  :height => 400,
  :width => 1140,
  :id => 'chart2',
  :type => 'bar3d',
  :renderAt => 'chart-container',
  :dataSource => {
    :chart => {
      :caption => "Week",
      :xAxisName => "Users",
      :yAxisName => "Hours",
      :numberPrefix => "",
      :paletteColors => "#0075c2",
      :bgColor => "#ffffff",
      :borderAlpha => "20",
      :canvasBorderAlpha => "0",
      :usePlotGradientColor => "0",
      :plotBorderAlpha => "10",
      :placevaluesInside => "1",
      :rotatevalues => "1",
      :valueFontColor => "#ffffff",
      :showXAxisLine => "1",
      :xAxisLineColor => "#999999",
      :divlineColor => "#999999",
      :divLineDashed => "1",
      :showAlternateHGridColor => "0",
      :subcaptionFontBold => "0",
      :subcaptionFontSize => "14"
    },
    :data => [{
        "label": "Vadym Kirdan",
        "value": "135"
      },
      {
        "label": "John Banana",
        "value": "147"
      },
      {
        "label": "Alex Ballack",
        "value": "128"
      },
      {
        "label": "Oleg Dizhak",
        "value": "133"
      },
      {
        "label": "Johnny Banana",
        "value": "140"
      }]
  }
})
  end

end


