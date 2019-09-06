class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :validatable

  devise :two_factor_authenticatable,
         otp_secret_encryption_key: ENV['MFA_ENCRYPTION_KEY_HERE']

  def otp_qr_code
    issuer = 'MFA'
    label = "#{issuer}:#{email}"
    qrcode = RQRCode::QRCode.new(otp_provisioning_uri(label, issuer: issuer))
    qrcode.as_svg(module_size: 4)
  end

  def update_otp_secret
    self.otp_secret = self.class.generate_otp_secret
    save
  end
end
