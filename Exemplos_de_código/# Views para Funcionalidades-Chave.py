# Views para Funcionalidades-Chave

from django.shortcuts import render
from .models import Servico, Desconto

def historico(request, cliente_id):
    servicos = Servico.objects.filter(veiculo__cliente_id=cliente_id)
    descontos = Desconto.objects.filter(cliente_id=cliente_id, utilizado=False)
    return render(request, 'historico.html', {'servicos': servicos, 'descontos': descontos})

# Enviar Mensagem via WhatsApp (usando Twilio)


from twilio.rest import Client
from django.conf import settings

def enviar_whatsapp(cliente, mensagem):
    if cliente.aceita_notificacoes and cliente.telefone_whatsapp:
        client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
        message = client.messages.create(
            body=mensagem,
            from_='whatsapp:+14155238886',  # Número do Twilio
            to=f'whatsapp:{cliente.telefone_whatsapp}'
        )
        Comunicacao.objects.create(
            cliente=cliente,
            mensagem=mensagem,
            status='ENVIADO'
        )


# 4. URLs (em urls.py)

from django.urls import path
from . import views

urlpatterns = [
    path('historico/<int:cliente_id>/', views.historico, name='historico'),
    path('api/enviar_whatsapp/', views.enviar_whatsapp, name='enviar_whatsapp'),
]

