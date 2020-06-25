# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
 ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
inflect.irregular 'club', 'clubes'
inflect.irregular 'tipo_entrega', 'tipos_entregas'
inflect.irregular 'pedido', 'pedidos'
inflect.irregular 'responsable', 'responsables'
inflect.irregular 'entrega', 'entregas'
inflect.irregular 'rol', 'roles'
inflect.irregular 'producto', 'productos'
inflect.irregular 'usuario', 'usuarios'
inflect.irregular 'ubicacion', 'ubicaciones'

#   inflect.uncountable %w( fish sheep )
 end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
