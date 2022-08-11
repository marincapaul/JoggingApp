module ApplicationHelper
  def paginate(collection, params= {})
    will_paginate collection, params.permit(:controller, :page, :id, :page).merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer).deep_symbolize_keys
  end
end
