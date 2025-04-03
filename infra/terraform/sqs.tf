resource "aws_sqs_queue" "processa-video_queue" {
  name                       = "processa-video"
  delay_seconds              = 0
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 600
}

resource "aws_sqs_queue" "video-em-processamento_queue" {
  name                      = "video-em-processamento"
  delay_seconds             = 0
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue" "processamento-realizado_queue" {
  name                      = "processamento-realizado"
  delay_seconds             = 0
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue" "erro-processamento_queue" {
  name                      = "erro-processamento"
  delay_seconds             = 0
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue" "notifica-video-processado_queue" {
  name                      = "notifica-video-processado"
  delay_seconds             = 0
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue" "notifica-video-erro_queue" {
  name                      = "notifica-video-erro"
  delay_seconds             = 0
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}