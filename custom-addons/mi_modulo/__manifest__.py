{
    'name': 'Mi Módulo',
    'version': '1.0',
    'summary': 'Módulo de ejemplo para Railway',
    'description': """
        Este es un módulo de ejemplo para demostrar
        la creación de addons personalizados en Railway.
    """,
    'category': 'Custom',
    'author': 'Tu Nombre',
    'website': 'https://www.ejemplo.com',
    'license': 'LGPL-3',
    'depends': ['base'],
    'data': [
        'views/mi_modelo_views.xml',
        'security/ir.model.access.csv',
    ],
    'demo': [],
    'installable': True,
    'auto_install': False,
    'application': True,
} 