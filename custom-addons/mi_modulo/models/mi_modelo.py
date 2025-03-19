from odoo import models, fields

class MiModelo(models.Model):
    _name = 'mi_modulo.mi_modelo'
    _description = 'Mi Modelo de Ejemplo'

    name = fields.Char('Nombre', required=True)
    description = fields.Text('Descripción')
    date = fields.Date('Fecha')
    active = fields.Boolean('Activo', default=True) 