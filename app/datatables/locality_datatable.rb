class LocalityDatatable < AjaxDatatablesRails::ActiveRecord
  
  def view_columns
    @view_columns ||= {
      name: { source: "Locality.name", cond: :like , searchable: false, orderable: false },
      area:{ source: "Locality.area", searchable: false, orderable: false },
      enabled:{ source: "Locality.enabled", searchable: false, orderable: false },
      options:{ searchable: false, orderable: false },
    }
  end



  def data
    records.map do |record|
      {
        name: record.name,
        area: record.area,
        enabled: record.enabled,
        options: ('<a href="/covid_situations/'+record.id.to_s+'"><i class="fa fa-eye"></i></a><a href="/covid_situations/'+record.id.to_s+'/edit"><i class="fa fa-pencil"></i></a><a data-confirm="¿Esta seguro que desea eliminar?" rel="nofollow" data-method="delete" href="/covid_situations/'+record.id.to_s+'"><i class="fa fa-trash-o"></i></a>').html_safe
      }
    end
  end

  
  def get_raw_records
    # insert query here
    Locality.all
  end

end
