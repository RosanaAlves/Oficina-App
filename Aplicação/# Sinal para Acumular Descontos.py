# Sinal para Acumular Descontos
# python
# Copy

from django.db.models.signals import post_save
from django.dispatch import receiver

@receiver(post_save, sender=Servico)
def verificar_desconto(sender, instance, **kwargs):
    if instance.status == 'CONCLUIDO':
        servicos = Servico.objects.filter(
            veiculo=instance.veiculo,
            status='CONCLUIDO'
        ).count()
        if servicos % 3 == 0:  # A cada 3 serviços, concede 5% de desconto
            Desconto.objects.create(
                cliente=instance.veiculo.cliente,
                veiculo=instance.veiculo,
                percentual=5,
                data_validade=timezone.now() + timezone.timedelta(days=30)
            )

#  7. Como Testar Localmente

#     Crie e aplique as migrações:

# bash
# Copy

# python manage.py makemigrations
# python manage.py migrate

#     Inicie o servidor:

# bash
# Copy

# python manage.py runserver

#     Acesse http://localhost:8000/historico/1 para ver o histórico do cliente com ID 1.