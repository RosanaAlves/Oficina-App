from django.db import models

class Cliente(models.Model):
    nome = models.CharField(max_length=100)
    cpf = models.CharField(max_length=14, unique=True)
    telefone = models.CharField(max_length=20)
    telefone_whatsapp = models.CharField(max_length=20, blank=True)
    aceita_notificacoes = models.BooleanField(default=True)

class Veiculo(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    modelo = models.CharField(max_length=50)
    placa = models.CharField(max_length=10, unique=True)

class Servico(models.Model):
    STATUS_CHOICES = [
        ('ORCAMENTO', 'Orçamento'),
        ('APROVADO', 'Aprovado'),
        ('CONCLUIDO', 'Concluído'),
    ]
    veiculo = models.ForeignKey(Veiculo, on_delete=models.CASCADE)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES)
    data_entrada = models.DateTimeField(auto_now_add=True)
    orcamento_aprovado = models.BooleanField(default=False)
    codigo_whatsapp = models.CharField(max_length=50, blank=True)

class Desconto(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    veiculo = models.ForeignKey(Veiculo, on_delete=models.CASCADE, null=True, blank=True)
    percentual = models.DecimalField(max_digits=5, decimal_places=2)
    data_validade = models.DateField()
    utilizado = models.BooleanField(default=False)

class Comunicacao(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    servico = models.ForeignKey(Servico, on_delete=models.CASCADE, null=True, blank=True)
    mensagem = models.TextField()
    data_envio = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=15, default='ENVIADO')

