def verificar_desconto(cliente_id, veiculo_id):
    servicos = Servico.objects.filter(
        veiculo_id=veiculo_id, 
        cliente_id=cliente_id
    ).count()
    if servicos % 3 == 0:
        Desconto.objects.create(
            cliente_id=cliente_id,
            veiculo_id=veiculo_id,
            percentual=5,
            data_validade=timezone.now() + timedelta(days=30)
        )